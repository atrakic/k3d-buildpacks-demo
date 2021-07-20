# k3d-buildpacks-demo

[![CI-buildpacks](https://github.com/atrakic/k3d-buildpacks-demo/actions/workflows/ci.yml/badge.svg)](https://github.com/atrakic/k3d-buildpacks-demo/actions/workflows/ci.yml)

This repo shows how to build java application using [Buildpacks](https://buildpacks.io/) and deploy it on [k3d](https://github.com/rancher/k3d).

## Demo
```
$ k get deployment,svc,po,ing          
NAME                   READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/demo   1/1     1            1           118s

NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.43.0.1       <none>        443/TCP   33m
service/demo         ClusterIP   10.43.231.240   <none>        80/TCP    118s

NAME                        READY   STATUS    RESTARTS   AGE
pod/demo-6bff4b4587-6mhwp   1/1     Running   0          118s

NAME                              CLASS    HOSTS   ADDRESS                       PORTS   AGE
ingress.networking.k8s.io/nginx   <none>   *       192.168.192.3,192.168.192.4   80      118s


$ kubectl logs demo-6bff4b4587-6mhwp -f
    |'-_ _-'|       ____          _  _      _                      _             _
    |   |   |      |  _ \        (_)| |    | |                    | |           (_)
     '-_|_-'       | |_) | _   _  _ | |  __| | _ __    __ _   ___ | | __ ___     _   ___
|'-_ _-'|'-_ _-'|  |  _ < | | | || || | / _` || '_ \  / _` | / __|| |/ // __|   | | / _ \
|   |   |   |   |  | |_) || |_| || || || (_| || |_) || (_| || (__ |   < \__ \ _ | || (_) |
 '-_|_-' '-_|_-'   |____/  \__,_||_||_| \__,_|| .__/  \__,_| \___||_|\_\|___/(_)|_| \___/
                                              | |
                                              |_|

:: Built with Spring Boot :: 2.1.18.RELEASE

2021-07-20 22:19:32.303  INFO 1 --- [           main] i.b.example.sample.SampleApplication     : Starting SampleApplication v0.0.1-SNAPSHOT on demo-6bff4b4587-6mhwp with PID 1 (/workspace/target/sample-0.0.1-SNAPSHOT.jar started by cnb in /workspace)
2021-07-20 22:19:32.307  INFO 1 --- [           main] i.b.example.sample.SampleApplication     : No active profile set, falling back to default profiles: default
2021-07-20 22:19:34.113  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port(s): 8080 (http)
2021-07-20 22:19:34.162  INFO 1 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2021-07-20 22:19:34.163  INFO 1 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet engine: [Apache Tomcat/9.0.39]
2021-07-20 22:19:34.287  INFO 1 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2021-07-20 22:19:34.288  INFO 1 --- [           main] o.s.web.context.ContextLoader            : Root WebApplicationContext: initialization completed in 1914 ms
2021-07-20 22:19:34.550  INFO 1 --- [           main] o.s.s.concurrent.ThreadPoolTaskExecutor  : Initializing ExecutorService 'applicationTaskExecutor'
2021-07-20 22:19:34.655  INFO 1 --- [           main] o.s.b.a.w.s.WelcomePageHandlerMapping    : Adding welcome page template: index
2021-07-20 22:19:34.820  INFO 1 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
2021-07-20 22:19:34.823  INFO 1 --- [           main] i.b.example.sample.SampleApplication     : Started SampleApplication in 3.11 seconds (JVM running for 3.73)
2021-07-20 22:19:40.108  INFO 1 --- [nio-8080-exec-1] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring DispatcherServlet 'dispatcherServlet'
2021-07-20 22:19:40.108  INFO 1 --- [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Initializing Servlet 'dispatcherServlet'
2021-07-20 22:19:40.115  INFO 1 --- [nio-8080-exec-1] o.s.web.servlet.DispatcherServlet        : Completed initialization in 7 ms

```
- [Github actions](https://github.com/atrakic/k3d-buildpacks-demo/actions)
- [app](http://localhost:8080)
