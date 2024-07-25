# python hello world application 
This repo houses a simple python application that produces a hello world page 

You will need the following software installed before you can run the script:

* docker
* minikube

Start your minikube cluster:

minikube start

Run run.sh script
```
$ ./run.sh
Building docker image...
[+] Building 3.9s (9/9) FINISHED 
 => [internal] load build definition from Dockerfile                                                                                                                                                                                            0.0s
 => => transferring dockerfile: 37B                                                                                                                                                                                                             0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                               0.0s
 => => transferring context: 2B                                                                                                                                                                                                                 0.0s
 => [internal] load metadata for docker.io/library/python:3                                                                                                                                                                         1.8s
 => [internal] load build context                                                                                                                                                                                                               0.0s
 => => transferring context: 54B                                                                                                                                                                                                                0.0s
 => [1/4] FROM docker.io/library/python:3@sha256:6b85854518f812d94cf2dfee2386df85b9cb78835a872d4769b4335f584c43ba                                                                                                                   0.0s
 => CACHED [2/6] WORKDIR /app                                                                                                                                                                                                         => CACHED [4/4] RUN pip install -r requirements.txt                                                                                                                                                                                                                                                                                             
 => exporting to image                                                                                                                                                                                                                          0.0s
 => => exporting layers                                                                                                                                                                                                      => => writing image sha256:01e0f0e3fef74345081af41a1d0383714b092196005c130af4306320a55db94a                                                                                                                                    
 => => naming to docker.io/local/helloworld-app:latest                                                                                                                                                                                          0.0s
Loading docker image to minikube
Deploying helloworld-app...
deployment.apps/python-helloworld created
service/python-helloworld created
Deployment completed (example below)

Status:
        machine: minikube
        pid: 3463
        route: 10.96.0.0/12 -> 192.168.64.3
        minikube: Running
        services: [python-helloworld]
    errors: 
                minikube: no errors
                router: no errors
                loadbalancer emulator: no errors

Please do not close this terminal as this process must stay alive for the tunnel to be accessible

Access the application

Once deployment is completed, open up a new terminal and type kubectl get svc, and use the external ip address to see if the pod is running ie http://10.111.175.72:8000/ 

Once the run.sh has completed running, please ensure the terminal session stays alive to keep the `LoadBalancer` running.
Ctrl-C in the terminal can be used to terminate the process at which time the network routes will be cleaned up.

Clean-up

To delete the deployment and service run clean-up.sh:

$ ./clean-up.sh
Deleting helloworld-app and service...
deployment.apps "helloworld-app" deleted
service "helloworld-app" deleted
Clean-up completed
