
default:	build

clean:
	rm -rf Makefile objs

.PHONY:	default clean

build:
	$(MAKE) -f objs/Makefile

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	/usr/local/nginx_babssl_1.1/sbin/nginx -t

	kill -USR2 `cat /usr/local/nginx_babssl_1.1/logs/nginx.pid`
	sleep 1
	test -f /usr/local/nginx_babssl_1.1/logs/nginx.pid.oldbin

	kill -QUIT `cat /usr/local/nginx_babssl_1.1/logs/nginx.pid.oldbin`

.PHONY:	build install modules upgrade
