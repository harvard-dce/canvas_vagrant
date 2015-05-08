last_commit=$(cd ~/canvas-lms && git log -n 1)
branch=$(cd ~/canvas-lms && git branch --no-color 2> /dev/null | grep '*' | sed  's/\* //')

echo -e "
\e[0m\e[33m*******************************
To run canvas:\e[0m

> cd ~/canvas-lms
> foreman start -f Procfile.dev

Wait about 30 seconds for the web interface to spin up, then it should
be available on:

http://192.168.50.4:3000/

username: vagrant@example.com
password: vagrant

\e[0m\e[33m*******************************
Last commit on \"$branch\" branch:\e[0m

$last_commit

Happy canvassing!
"
