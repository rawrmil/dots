#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include <pthread.h>
#include <X11/Xlib.h>

char weather[256] = "Pending...";
char battery[256] = "Pending...";
char datetime[256] = "Pending...";

#define POPEN(_ptr, cmd, mode) \
		FILE* _ptr = popen(cmd, mode); \
		if (_ptr == NULL) { printf("POPEN NULL"); exit(1); }

void* update_weather(void* arg) {
	while (1) {
		POPEN(fp, "curl 'wttr.in/saint-petersburg?format=%t(%h),%C(%p),%w'", "r")
		fgets(weather, sizeof(weather), fp);
		weather[strcspn(weather, "\n")] = 0;
		pclose(fp);
		sleep(30);
	}
	return NULL;
}

void* update_battery(void* arg) {
	while (1) {
		POPEN(fp, "acpi -b | grep -oP '[0-9]+(?=%)' | awk '{print \"POWER: \"$1\"%\"}' | head -1", "r")
		if (fgets(battery, sizeof(battery), fp) == NULL) {
			strcpy(battery, "POWER: INFINITE");
		} else {
			battery[strcspn(battery, "\n")] = 0;
		}
		pclose(fp);
		sleep(10);
	}
	return NULL;
}


void* update_datetime(void* arg) {
	while (1) {
		time_t t = time(NULL);
		struct tm tm = *localtime(&t);
		strftime(datetime, sizeof(datetime), "%Y-%m-%d %H:%M:%S", &tm);
		sleep(1);
	}
	return NULL;
}

int main() {
	pthread_t weather_thread, battery_thread, datetime_thread;

	pthread_create(&weather_thread, NULL, update_weather, NULL);
	pthread_create(&battery_thread, NULL, update_battery, NULL);
	pthread_create(&datetime_thread, NULL, update_datetime, NULL);

	Display *display = XOpenDisplay(NULL);
	if (display == NULL) {
		fprintf(stderr, "Cannot open display\n");
		return 1;
	}

	Window root = DefaultRootWindow(display);
	char status_string[1024];

	while (1) {
		snprintf(status_string, sizeof(status_string), "%s | %s | %s", weather, battery, datetime);
		XStoreName(display, root, status_string);
		XFlush(display);
		usleep(1000);
	}

	XCloseDisplay(display);
	return 0;
}
