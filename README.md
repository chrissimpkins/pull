<img src="https://raw.githubusercontent.com/chrissimpkins/pull/master/img/readme-header.png" alt="Pull" width="748">

# Pull

Pull combines HTTP GET file requests and git repository clones to support pulls of the following contents in your OS X clipboard:

- File URL strings
- GitHub repository HTTPS URL strings
- GitHub repository [user]/[project] repository titles

Copy a URL string or repository user/project string from any application to the OS X clipboard, click the Pull status menu button, and select the Pull confirmation message in the menu.  Pull does the rest.  You will find the pulled files in your Downloads directory.

<img src="https://raw.githubusercontent.com/chrissimpkins/pull/master/img/pull-screenshot2.png" alt="Click the Pull icon" width="518">


### Install

- [Download the dmg installer](https://github.com/chrissimpkins/pull/releases/download/v0.10.0/Pull-Installer.dmg)
- Click the installer
- Drag and drop the Pull application in your Applications directory

Please note that [Git must be installed on your system](https://git-scm.com/downloads) to perform git clones of git repositories.  It is not embedded in the application.

#### Start Pull at Login

Open System Settings > Users and Groups and click on the Login items tab.  Click the `+` button at the bottom of the list and select the Pull application from your list of installed applications.


### Usage

#### Launch Pull

You can manually launch the application by locating the Pull application with Launchpad.  Click the Pull icon to load the status menu icon in your status bar.  Use the instructions above to start Pull at login in order to avoid this step.

#### Pull Things

Copy any of the supported strings to the OS X clipboard and click the Pull status menu icon.  Select the menu item that describes what Pull will do.  Done.  Look in your Downloads directory.  Be patient if it is a large file or repository.  It's not magic.

#### Quit Pull

Select `Quit Pull` in the Pull status bar icon menu.


### License

[MIT License](https://github.com/chrissimpkins/pull/blob/master/LICENSE)
