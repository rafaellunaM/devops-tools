# Fundamentos datadog

## Introduction

### Datadog is a software-as-a-service (Saas)
    * monitoring data - metrics, traces, and logs.
    * put all that data in one place

## Introduction to USM
Offers a view of service health metrics across your entire technology stack, without the need to instrument your code. Instead, it relies on the presence
of a configured datadog agente and Unified Service Tagging to collect data about your existing services, which can then be viewed through the service
catalog

Unified service tagging: USM is capable of identifying services through commonly used containers tags (such as app, short_image, and container_name), and
automatically generates corresponding entries in the service catalog, why automatically includes services detected by USM.