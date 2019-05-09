# utimbox
Ultimate utility box image

# Trouble Shoot

## can not remove utimbox namespace

log:  
```
Operation cannot be fulfilled on namespaces "utimbox": The system is ensuring all content is removed from this namespace.  Upon completion, this namespace will automatically be purged by the system.
```

solution:
```
kubectl get namespace <terminating-namespace> -o json >tmp.json
Edit your tmp.json file. Remove the kubernetes value from the finalizers field and save the file.
kubectl proxy &
curl -k -H "Content-Type: application/json" -X PUT --data-binary @tmp.json http://127.0.0.1:8001/api/v1/namespaces/<terminating-namespace>/finalize
```

reference:
- https://www.ibm.com/support/knowledgecenter/en/SSBS6K_3.1.1/troubleshoot/ns_terminating.html
