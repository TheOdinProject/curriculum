### Guide: Install VSCode on Linux

#### Step 1: Download VSCode

Open your **terminal** then run the following command to download the latest **VSCode** `.deb` package:

```bash
wget -O code-latest.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
```

#### Step 2: Install VSCode

Enter the following commands in your terminal to install the **VSCode** `.deb` package:

```bash
sudo apt update
sudo apt upgrade
sudo apt install ./code-latest.deb
```

Then, if prompted, enter your password.

<div class="lesson-note lesson-note--tip" markdown="1">

#### Adding Microsoft's VSCode repository (optional)

If you prefer to have VSCode update automatically alongside your other system updates, you can add Microsoft's official VSCode repository to your apt sources. This is completely fine and safe to do. The repository will allow VSCode to be updated whenever you run `sudo apt update && sudo apt upgrade` with your other system packages.

</div>

<div class="lesson-note lesson-note--tip" markdown="1">

#### Typing passwords in the terminal

When using a command in the terminal that requires you to enter your password for authentication (such as `sudo`), you will notice that the characters aren't visible as you type them. While it might seem like the terminal isn’t responding, don’t worry!

This is a security feature to protect confidential information, like how password fields on websites use asterisks or dots. By not displaying the characters you write, the terminal keeps your password secure.

You can still enter your password as normal and press Enter to submit it.

</div>

<div class="lesson-note lesson-note--tip" markdown="1">

#### Notice about unsandboxed download

If you see a something like `N: Download is performed unsandboxed (...)`, you don't need to worry about it as the [`N:` just means it's a notice and not a warning](https://www.reddit.com/r/linux4noobs/comments/ux6cwx/comment/i9x2twx/).

</div>

#### Step 3: Delete the installer file

Run the following command:

```bash
rm code-latest.deb
```

#### Step 4: Using VSCode

You can start VSCode in one of two ways:

- Click **Visual Studio Code** from the Applications menu
- In the terminal, run the following command:

  ```bash
  code
  ```

[Return to Text Editors lesson](https://www.theodinproject.com/lessons/foundations-text-editors#assignment)
