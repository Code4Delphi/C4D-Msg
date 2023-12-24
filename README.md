# C4D-Msg - Control your system's message quickly, easily and centrally
<p align="center">
  <a href="https://github.com/Code4Delphi/Code4D-Wizard/blob/master/Images/C4D-Logo.png">
    <img alt="Code4Delphi" height="100" src="https://github.com/Code4Delphi/Code4D-Wizard/blob/master/Images/c4d-logo-100x100.png">
  </a> 
</p>
With C4D-Msg you can control your system messages quickly, easily and centrally



## 📞 Contacts

<p align="left">
  <a href="https://t.me/Code4Delphi" target="_blank">
    <img src="https://img.shields.io/badge/Telegram:-Join%20Channel-blue?logo=telegram">
  </a> 
  &nbsp;
  <a href="mailto:contato@code4delphi.com.br" target="_blank">
    <img src="https://img.shields.io/badge/E--mail-contato%40code4delphi.com.br-yellowgreen?logo=maildotru&logoColor=yellowgreen">
  </a>
   &nbsp;
  <a href="https://www.youtube.com/@code4delphi" target="_blank">
    <img src="https://img.shields.io/badge/YouTube:-Join%20Channel-red?logo=youtube&logoColor=red">
  </a> 
</p>



## ⚙️ Installation

* Installation using the [**Boss**](https://github.com/HashLoad/boss):

```
boss install github.com/Code4Delphi/C4D-Msg
```

* **Manual installation**: Open your Delphi and add the following folder to your project, under *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*

```
C4D-Msg\Src
```



## 🚀 Quickstart
* Add uses to your system:
```
uses
  C4D.Msg;
```

#### Make calls from your messages:

* Information message:
```
ShowMsg('My message', 'More details (optional)');
```

* Warning message:
```
ShowWarning('My message', 'More details (optional)');
```

* Success message:
```
ShowSuccess('My message', 'More details (optional)');
```

* Error message:
```
ShowError('My message', 'More details (optional)');
```

* Permission message:
```
ShowPermission('My message', 'More details (optional)');
```

* Obligatory message:
```
ShowObligatory('My message (optional)', 'More details (optional)');
```

* Empty message:
```
ShowEmpty('My message', 'More details (optional)');
```

* ShowQuestion:
```
  if(ShowQuestion('My question', 'More details (optional)'))then
    ShowSuccess('Responded Yes')
  else
    ShowError('Responded No');
```


## ⌨️ Demo
* Next to the project sources, you will find a test project, in the folder:
```
C4D-Msg\Samples
```


‌
# 💬 Contributions / Ideas / Bug Fixes
To submit a pull request, follow these steps:

1. Fork the project
2. Create a new branch (`git checkout -b minha-nova-funcionalidade`)
3. Make your changes
4. Make the commit (`git commit -am 'Functionality or adjustment message'`)
5. Push the branch (`git push origin Message about functionality or adjustment`)
6. Open a pull request
