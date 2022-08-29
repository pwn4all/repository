
# log setting

### 1. Menu
  - Setting > Editor > Live Templates

### 2. create Templates in Kotlin
  - Abbrevivation : logd
  - Description.  : log.d(TAG, content)
  - Template Text : Log.d(TAG,"$CLASS_NAME$ - $METHOD_NAME$() called")

### 3. coding
```kotlin
class MainActivity : AppCompatActivity() {

    val TAG: String = "mylog"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
    
    override fun onStart() {
        super.onStart()
        Log.d(TAG,"MainActivity - onStart() called")
    }
    .
    .
    .
    
}
```

### 4. filterd view on logcat in andoidstudio
  - filter : mylog
```bash
2022-08-29 15:14:23.276 26629-26629/com.example.myapplication D/Log: MainActivity - onStart() called
2022-08-29 15:14:23.280 26629-26629/com.example.myapplication D/Log: MainActivity - onResume() called
2022-08-29 15:14:27.399 26629-26629/com.example.myapplication D/Log: MainActivity - onPause() called
2022-08-29 15:14:27.854 26629-26629/com.example.myapplication D/Log: MainActivity - onStop() called
```
