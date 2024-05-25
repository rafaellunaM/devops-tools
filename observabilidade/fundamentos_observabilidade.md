# monitoring vs observability

## monitoring:
monitoring is the process of gathering data to understand what`s going on inside of your infrastructure

## observability
observability is taking the same data that you`ve collected and moving beyound "whats is happening" to "Why is it happening"


## three pillars of observability

metrics: These data points are numerical values that can track anything about your enviroment over time 

logs: A computer generated file that contains time stamped information about the usage of that system  

Traces: use to track the time spent by an application processing a request and the status of this request


### Metrics:
Metrics are numerical values that can track anything about your enviroment over time, from latency to error rates to user signups
Example metrics: 
    [17.2, 22:11:01]
    [19.2, 22:30:01]

Baseline for operations: Metrics can tell us what normal looks like for our applications. Without metrics, we´re stuck guessing what`s going on

Reactive Responses: Using metrics we don´t have to wait until a customer reports an outage. We can react to issues in our enviroment before they snowball

Proactive responses: Why wait for something to go wrong? By looking at metrics we can get ahead of problems before they happen 

### Monitoring:
Monitoring is the act of paying atteiong to the patterns that your metrics are telling you. It´s about analyzing your data and acting on it

What do we monitor?
Perfomance: By watching performance we can watch how our architecture and applications are using the resources taht are available 

security: Is something going wrong in our enverioment? Creating monitors around security metrics can stop incidents in their tracks

usage: What are our users doing in our enviroment? Are they interacting with our products?

Alerting:
Alerts are simply setting a trreshhold in a monitor. Whent that threshold is breached, a notificaton is sent to the designated recipient 

### Log

A log is a computer generated file that contains information regarding the usage of a system. This gives you insight into the behavior of the resource.

Why do we collect logs?

Compliance: Standards that the business if held to might dictate which logs you´ll need to store and for how long you need to store them.

Insight: Logs can give you insight into application and system performance that metrics by themselves might not be able to provide

Security: This is priority for businesses. Logs are needed to demonstrate that only authorized activities are going on inside of a system


### Trace

A trace is used to track the time spent by an application processing a request along with the execution path taken

Why do we collect traces?

Microservices: As business migrate away from monolithic architecture, tracing is needed to figure out what all  of the microservices are up to

Optimization: Tracing allows you to optimize the performance of your applications by identifying bottlenecks in the calls being made

Troubleshooting: When something goes wrong, we need insight into the actual application code. This can assist us in tracking down errors with the code.


Alerts are simply setting a trreshhold in a monitor. Whent that threshold is breached, a notificaton is sent to the designated recipient 