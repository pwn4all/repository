***timedatectl Options***


```bash
# sync time automatically
-------------------------------------------
$ date
2022. 07. 05. (화) 13:42:05 KST
-------------------------------------------
$ sudo timedatectl set-ntp on
-------------------------------------------
$ date
2022. 07. 05. (화) 17:42:05 KST
-------------------------------------------
```



```bash
# set time manually
-------------------------------------------
$ sudo timedatectl set-ntp off

-------------------------------------------
$ sudo date -s "20220621 09:00:00"
2022. 06. 21. (화) 09:00:00 KST
-------------------------------------------
$ date
2022. 06. 21. (화) 09:00:02 KST
-------------------------------------------
```
