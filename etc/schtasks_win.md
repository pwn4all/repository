**1) Option**
```bash
> SchTasks /?
.
.
  /Create
  /Delete
  /Change
  /Run
  /End
  /ShowSid
  /?
```


**2) create schedule**

```bash
> SchTasks /Create /SC DAILY /TN "service_name" /TR "C:\Python27\python.exe c:\Users\user\Downloads\service_name.py" /ST 02:00

```


**3) delete schedule**

```bash
> SchTasks /Delete /TN "service_name"

```

**3) query schedule**

```bash
> SchTasks /Query /V /TN "service_name"

```


**4) change schedule**

```bash
> SchTasks /Change /SC DAILY /TN "service_name" /TR "C:\Python27\python.exe c:\Users\user\Downloads\service_name.py" /ST 03:00

```


**5) run schedule**

```bash
SchTasks /Run /TN "service_name"

```
