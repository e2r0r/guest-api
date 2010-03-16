#!/usr/bin/perl

exit if fork();
while(1) {
	my $a = `ps --no-headers -A -o "vsz \%cpu rss sz ucomm pid" | awk '{if (\$1 > 600000 && \$5 == "python") print \$6}'`;
if ($a) {
	my $b = `kill -9 %a`;
	my $c = `spawn-fcgi -f /data/www/guest/code.fcgi -a 127.0.0.1 -p 8090 -C 8`;
        my $d = `killall -HUP nginx`;
	}
sleep(60);
}
	
