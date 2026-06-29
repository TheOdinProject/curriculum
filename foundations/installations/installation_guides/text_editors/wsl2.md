### Guide: Install VSCode on WSL2

#### Step 1: Install VSCode

Follow the instructions for [installing Visual Studio Code on Windows](https://code.visualstudio.com/docs/setup/windows).

#### Step 2: Delete the installer file

1. Open **File Explorer**.
1. Go to the **Downloads** folder.
1. Drag `VSCodeUserSetup-{version}.exe` to the trash.

#### Step 3: Install WSL Extension

1. Open Visual Studio Code.
1. Navigate to the extensions tab.
1. Find and install the [WSL extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl).

#### Step 4: Ensure that WSL2 can correctly open VSCode

1. Open a new WSL2 terminal.
1. Run the following command to open a new VSCode window in WSL2:

   ```bash
   code
   ```

After a few moments a new VSCode window should open, and VSCode should provide a notification that its opening in WSL2.

Going forward, this is how you should be opening VSCode to ensure it is using WSL2 and not your Windows OS/file system.

[Return to Text Editors lesson](https://www.theodinproject.com/lessons/foundations-text-editors#assignment)
