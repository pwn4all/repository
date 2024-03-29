
# simple 2 activities (button click event)


## for button design
### 1. res > drawable > rounded_corner_green.xml
  - Gradle Scripts > build.gradle(Module: My_Application....)
```xml
<?xml version="1.0" encoding="utf-8"?>
<shape xmlns:android="http://schemas.android.com/apk/res/android">
<!--    <solid android:color="#7ef192"/>-->
    <gradient
        android:type="linear"
        android:angle="45"
        android:startColor="#89C89D"
        android:endColor="#2dc897"
        />

<!--    <stroke android:width="3dp"-->
<!--        android:color="#ff000000" />-->

<!--    <padding android:left="1dp"-->
<!--        android:top="1dp"-->
<!--        android:right="1dp"-->
<!--        android:bottom="1dp" />-->

    <corners
        android:bottomLeftRadius="30dp"
        android:bottomRightRadius="30dp"
        android:topLeftRadius="30dp"
        android:topRightRadius="30dp"
        />
</shape>
```

## for button layout
### 2-1. res > layout > activity_main.xml
```xml
    <Button
        android:id="@+id/btn_1"
        android:layout_width="match_parent"
        android:layout_height="60dp"
        android:text="Button-1"
        android:textAllCaps="false"
        android:textColor="#fff"
        android:textStyle="bold"
        android:textSize="20dp"
        app:backgroundTint="@null"
        android:background="@drawable/rounded_corner_green"
        />

    <Button
        android:id="@+id/btn_2"
        android:layout_marginTop="10dp"
        android:layout_width="match_parent"
        android:layout_height="60dp"
        android:text="Button-2"
        android:textAllCaps="false"
        android:textColor="#fff"
        android:textStyle="bold"
        android:textSize="20dp"
        app:backgroundTint="@null"
        android:background="@drawable/rounded_corner_blue"
        />
```

### 2-2. res > layout > activity_popup.xml
```xml
    <Button
        android:id="@+id/btn_back"
        android:onClick="onBackButtonClicked "
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:textSize="50dp"
        android:text="Back"
        android:layout_centerInParent="true"
        />
```


## for button activity
### 3-1. java > package_name > MainActivity
  - Gradle Scripts > build.gradle(Module: My_Application....)
```kotlin
class MainActivity : AppCompatActivity() {

    val TAG: String = "logdd"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val button1 = findViewById<Button>(R.id.btn_1)
        button1.setOnClickListener() {
            onLoginButtonClicked()
        }
        val button2 = findViewById<Button>(R.id.btn_2)
        button2.setOnClickListener() {
            onLoginButtonClicked()
        }
    }

    fun onLoginButtonClicked() {
        Log.d(TAG,"MainActivity - onLoginButtonClicked() called")
    }
}
```

### 3-2. java > package_name > PopupActivity
  - Gradle Scripts > build.gradle(Module: My_Application....)
```kotlin
class PopupActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_popup)

        val button_back = findViewById<Button>(R.id.btn_back)
        button_back.setOnClickListener() {
            onBackButtonClicked(R.layout.activity_popup)
        }
    }

    fun onBackButtonClicked(view: Int){
        Log.d(TAG,"PopupActivity - onBackButtonClicked() called")

        finish()
    }
}
```



