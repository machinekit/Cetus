Cetus
=====

Full-featured remote user interface for Machinekit based on [QtQuickVcp](https://github.com/qtquickvcp/QtQuickVcp).

![Alt text](/doc/Cetus.png "Cetus")

For more information on how to use Cetus please read the [QtQuickVcp documentation](https://github.com/qtquickvcp/QtQuickVcp).

## Using Cetus

To use Machineface you have to clone the repository on your Machinekit computer:

``` bash
cd ~/
git clone https://github.com/qtquickvcp/Cetus.git
```

Next, you have to supply the path to the directory to the *configserver*.

``` bash
configserver -n 'My Machine' ~/Cetus
```

The UI is then automatically deployed to the [Machinekit Client](https://github.com/qtquickvcp/QtQuickVcp#download)

For more information about using Machinekit with remote user interfaces please read the [QtQuickVcp documentation](https://github.com/machinekoder/QtQuickVcp#using_mkwrapper).
