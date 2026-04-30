### Introduction

[Git](https://git-scm.com/) is a very popular version control system. You'll become very familiar with this piece of software throughout TOP, so don't worry too much about understanding it at this point. There are many lessons focused on Git later in the curriculum.

[GitHub](https://github.com/) is a service that allows you to upload, host, and manage your code using Git with a nice web interface.

Even though GitHub and Git sound similar, they are not the same or even created by the same company.

### Assignment

<div class="lesson-content__panel" markdown="1">

#### Install Git

1. Depending on the OS you are running, following the appropriate Git installation guide below:
   - [Linux](https://github.com/TheOdinProject/curriculum/tree/main/foundations/installations/installation_guides/git/linux.md "Linux Git installation")
   - [MacOS](https://github.com/TheOdinProject/curriculum/tree/main/foundations/installations/installation_guides/git/macos.md "MacOS Git installation")
   - [ChromeOS](https://github.com/TheOdinProject/curriculum/tree/main/foundations/installations/installation_guides/git/chromeos.md "ChromeOS Git installation")

#### Configure Git and GitHub

1. Go to [GitHub.com](https://github.com/) and create an account! During the account setup, it will ask you for an email address. This needs to be a real email, and will be used by default to identify your contributions. If you are privacy conscious, or just don't want your email address to be publicly available, make sure you tick the following two boxes on the [Email Settings](https://github.com/settings/emails) page after you have signed in:

   ![GitHub private email settings](https://cdn.statically.io/gh/TheOdinProject/curriculum/725b80d126105d2f717697f97e7eaefb5f886c7b/foundations/installations/setting_up_git/imgs/01.png)

   Having these two options enabled will prevent accidentally exposing your personal email address when working with Git and GitHub.

   You may also notice an email address under the **Keep my email addresses private** option. This is your private GitHub email address. **If you plan to use this, make note of it now as you will need it when setting up Git in the next step.**

   1. (Optional) Enable GitHub two-factor authentication (2FA), which is an extra layer of security used when logging into websites or apps. With 2FA, you have to log in with your username and password and provide another form of authentication that only you know or have access to.

      Go to [GitHub 2FA Docs](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication#configuring-two-factor-authentication-using-a-totp-app), then follow the configuration instructions. For step 1, we recommend Google Authenticator, which is a time-based one-time password (TOTP) app. Go to [Google Account Help](https://support.google.com/accounts/answer/1066447), click `Android` or `iPhone & iPad`, then follow the download and set up instructions.

      <div class="lesson-note lesson-note--warning" markdown=1>

      #### Losing 2FA credentials or access to account recovery codes

      For security reasons, GitHub Support will not be able to restore access to accounts with two-factor authentication enabled if you lose your two-factor authentication credentials or lose access to your account recovery methods.

      </div>

1. For Git to work properly, we need to let it know who we are so that it can link a local Git user (you) to GitHub. When working on a team, this allows people to see what you have committed and who committed each line of code.

   The commands below will configure Git. Be sure to enter your own information inside the quotes (but include the quotation marks!) - if you chose to keep your email private on GitHub, use your special private GitHub email from step 2.1.

   ```bash
   git config --global user.name "Your Name"
   git config --global user.email yourname@example.com
   ```

   For example, if you set your email as private on GitHub, the second command will look something like this:

   ```bash
   git config --global user.email 123456789+odin@users.noreply.github.com # Remember to use your own private GitHub email here.
   ```

   GitHub recently changed the default branch on new repositories from `master` to `main`. Change the default branch for Git using this command:

   ```bash
   git config --global init.defaultBranch main
   ```

   To verify that things are working properly, enter these commands and verify whether the output matches your name and email address.

   ```bash
   git config --get user.name
   git config --get user.email
   ```

   <div class="lesson-note" markdown="1">

   #### For macOS Users

   Run these two commands to tell Git to ignore .DS_Store files, which are automatically created when you use Finder to look into a folder. .DS_Store files are invisible to the user and hold custom attributes or metadata (like thumbnails) for the folder, and if you don't configure Git to ignore them, pesky .DS_Store files will show up in your commits. Remember to copy and paste each of these commands into your terminal.

   ```bash
   echo .DS_Store >> ~/.gitignore_global
   git config --global core.excludesfile ~/.gitignore_global
   ```

   </div>

1. Create an SSH key, which is a cryptographically secure identifier. It's like a really long password used to identify your machine. GitHub uses SSH keys to allow you to upload to your repository without having to type in your username and password every time.

   <div class="lesson-note" markdown="1">

   #### Multiple SSH keys

   If you have already setup an ssh key pair with GitHub on a different machine prior to starting The Odin Project, GitHub allows you to have multiple key pairs associated with your account. You can just follow these instructions again to set up another key pair and register it with GitHub.

   </div>

   First, we need to see if you have an Ed25519 algorithm SSH key already installed. Type this into the terminal and check the output with the information below:

   ```bash
   ls ~/.ssh/id_ed25519.pub
   ```

   If a message appears in the console containing the text "No such file or directory", then you do not yet have an Ed25519 SSH key, and you will need to create one. If no such message has appeared in the console output, you can proceed to step 2.5.

   To create a new SSH key, run the following command inside your terminal.

   ```bash
   ssh-keygen -t ed25519
   ```

   When it prompts you for a location to save the generated key, just push <kbd>Enter</kbd>.

   Next, it will ask you for a passphrase. This passphrase is used to encrypt the private SSH key that is stored on your computer and you will be required to enter this passphrase every time you use SSH with these keys. If you don't use a passphrase, the private key will be readable by anyone who has access to your computer and will be able to modify all your GitHub repositories. Enter one if you wish, but it’s not required. If you choose not to use a passphrase, just hit <kbd>Enter</kbd> without typing anything.

1. Now, you need to tell GitHub what your SSH key is so that you can push your code without typing in a password every time.

   First, you'll navigate to where GitHub receives our SSH key. Log into GitHub and click on your profile picture in the top right corner. Then, click on `Settings` in the drop-down menu.

   Next, on the left-hand side, click `SSH and GPG keys`. Then, click the green button in the top right corner that says `New SSH Key`. Name your key something that is descriptive enough for you to remember what device this SSH key came from, for example `linux-ubuntu`. Leave this window open while you do the next steps.

   Now you need to copy your public SSH key. To do this, we're going to use a command called [`cat`](http://www.linfo.org/cat.html) to read the file to the console. (Note that the `.pub` file extension is important in this case.)

   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```

   Highlight and copy the entire output from the command. If you followed the instructions above, the output will likely begin with `ssh-ed25519` and end with your `username@hostname`.

   Now, go back to GitHub in your browser window and paste the key you copied into the key field. Keep the key type as `Authentication Key` and then, click `Add SSH key`. You're done! You've successfully added your SSH key!

1. Testing your key by following [GitHub's directions for testing your SSH connection](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection?platform=linux). Make sure the fingerprint output in the terminal matches [one of GitHub's four public fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints).

   You should see this response in your terminal: `Hi username! You've successfully authenticated, but GitHub does not provide shell access.` Don't let GitHub's lack of providing shell access trouble you. If you see this message, you've successfully added your SSH key and you can move on. If the output doesn't correctly match up, then try going through these steps again or come to [our Discord server](https://discord.gg/fbFCkYabZB) to ask for help.

#### All done!

Let us know how it went! You've completed the basic installations section, good job! As you progress through the curriculum, there will be other tools to install, so keep an eye out!

You probably felt like you were way in over your head, and you probably didn't understand much of what you were doing. That's 100% normal. Hang in there. You can do this! And we've got your back.

</div>
