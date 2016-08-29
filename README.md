# docker-build-diag
Docker container with diagnostic output for OpenShift docker builder.

Displays build relevant configuration during a OpenShift Docker build.

## OpenShift diagnostic project

### checkout this repository
Checkout this github repository.

### create project
`oc new-project docker-build-diag`

### create app by template
```
oc process -f docker-build-diag-template.json \
  | oc create -f -
```
