package com.example.novanet;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.MediaStore;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.Manifest;

public class MainActivity extends AppCompatActivity {

    private static final int PERMISSION_REQUEST_CODE = 100;
private WebView OrionWeb;
private WebSettings Websettings;
    private ValueCallback<Uri[]> mUploadMessage;
    private final static int FILECHOOSER_RESULTCODE = 1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            checkPermissions();
        }
        OrionWeb=findViewById(R.id.weborion);
        Websettings=OrionWeb.getSettings();
        Websettings.setJavaScriptEnabled(true);
        Websettings.setDomStorageEnabled(true);
        Websettings.setAllowFileAccess(true);
        Websettings.setAllowFileAccessFromFileURLs(true);
        Websettings.setAllowUniversalAccessFromFileURLs(true);
        OrionWeb.loadUrl("https://orion.novanetgroup.com");
        OrionWeb.setWebViewClient(new WebViewClient());
        // Configurar WebChromeClient para manejar la carga de archivos
        OrionWeb.setWebChromeClient(new WebChromeClient() {

            @Override
            public boolean onShowFileChooser(WebView webView, ValueCallback<Uri[]> filePathCallback, FileChooserParams fileChooserParams) {
                mUploadMessage = filePathCallback;

                // Crear un intent para abrir el selector de archivos
                Intent intent = fileChooserParams.createIntent();

                // Verificar si la actividad de la cámara está disponible
                Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
                if (takePictureIntent.resolveActivity(getPackageManager()) != null) {
                    // Crear un intent para tomar una foto
                    Intent chooserIntent = Intent.createChooser(intent, "Seleccione una opción");

                    // Crear una lista de opciones (Galería o Cámara)
                    chooserIntent.putExtra(Intent.EXTRA_INITIAL_INTENTS, new Intent[]{takePictureIntent});

                    // Iniciar la actividad para seleccionar archivos o tomar una foto
                    try {
                        startActivityForResult(chooserIntent, FILECHOOSER_RESULTCODE);
                    } catch (ActivityNotFoundException e) {
                        mUploadMessage = null;
                        return false;
                    }
                } else {
                    // Si la actividad de la cámara no está disponible, continuar con la selección de archivos
                    try {
                        startActivityForResult(intent, FILECHOOSER_RESULTCODE);
                    } catch (ActivityNotFoundException e) {
                        mUploadMessage = null;
                        return false;
                    }
                }
                return true;
            }
        });

    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    private void checkPermissions() {
        // Lista de permisos que la aplicación necesita solicitar
        String[] permissions = {
                Manifest.permission.CAMERA,
                Manifest.permission.WRITE_EXTERNAL_STORAGE,
                Manifest.permission.READ_EXTERNAL_STORAGE,
                Manifest.permission.ACCESS_FINE_LOCATION
        };

        // Comprueba si los permisos ya están concedidos
        for (String permission : permissions) {
            if (checkSelfPermission(permission) != PackageManager.PERMISSION_GRANTED) {
                // Solicita los permisos que no han sido concedidos
                requestPermissions(permissions, PERMISSION_REQUEST_CODE);
                return;
            }
        }
        // Los permisos ya están concedidos, puedes realizar acciones que requieran estos permisos.
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent intent) {
        super.onActivityResult(requestCode, resultCode, intent);
        if (requestCode == FILECHOOSER_RESULTCODE) {
            if (mUploadMessage == null) return;
            Uri result = null;
            if (resultCode == RESULT_OK && intent != null) {
                try {
                    result = intent.getData();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            try {
                mUploadMessage.onReceiveValue(new Uri[]{result});
            } catch (Exception e) {
                e.printStackTrace();
            }
            mUploadMessage = null;
        }
    }

    @Override
    public void onBackPressed(){
        if(OrionWeb.canGoBack()){
            OrionWeb.goBack();
        }
        else{
            super.onBackPressed();
        }


    }
}