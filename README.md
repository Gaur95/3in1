# 3in1
ssh , apache2 , docker in one dockerfile
## container run like this
```
docker run -itd --privileged -v docker:/var/lib/docker/ -p 1145:80 -p 1156:22 aakashgaur57/3in1:v1 

```
## For ssh
```
User - root
Password - q123
```
