last_commit=$(cd ~/canvas-lms && git log -n 1)
branch=$(cd ~/canvas-lms && git branch --no-color 2> /dev/null | grep '*' | sed  's/\* //')

echo "
*******************************
To run canvas:
> cd ~/canvas-lms
> foreman start -f Procfile.dev

Wait about 30 seconds for the web interface to spin up, then it should
be available on:

http://192.168.50.4:3000/

username: vagrant@example.com
password: vagrant

*******************************
Last commit on \"$branch\" branch:

$last_commit

Happy canvassing!
"
