For the daily operation of AIX or Linux system administrator, the quantity of you managed servers and duplicate tasks will impact seriously your workload and efficency, and these are very baldness and boring. I aim to reduce the daily effort for every Unix/Linux system administrator, so we can release more free time to study some new skills. I named the set of scripts ztools, it includes the zcmd, ,zmksysb,zperf, znmon etc, it will provide you more reliable and simply administrator, the following are the introduction for each tool.

Official Website: https://www.ibm.com/developerworks/community/wikis/home?lang=en#!/wiki/ztools

1. Download: In the below Page "Attachments", please download the latest version;

2. Pre-requisite: The korsh shell must be existed on your system, you can execute the "which ksh" to check if you already install the korsh shell;

3. Installation: You'd better use the root privilege to decompress the package and execute the "./install.sh";

4. $PATH: You'd better put the tools directory into the system variable $PATH, so you can execute this without absolute path.

      For KSH: edit .profile in the home directory, add the "export PATH=$PATH:/usr/local/ztools/bin"

      For BASH: edit .bashrc in the home directory, add the "export PATH=$PATH:/usr/local/ztools/bin"

      For CSH: edit .cshrc in the home directory, add the "set path = ($path /usr/local/ztools/bin)"

5. Component Introduction:

     zcmd: Remote and batch to execute the commands or upload/download files on UNIX/Linux/HMC Platform, you can execute the command which you want  by ssh or rsh in batch, also you can transfer the files or directories by ssh/rsh in batch too.

     zmksysb: Backup the AIX system and upload the mksysb Image automaticly

     zperf: Lightly collect and show the trend of the performance indicator which you want in terminal mode on AIX/Linux servers

     zsysinfo: Backup the system Information before reboot the AIX or Linux servers, in case you lose some information in the running system

     znmon: Call the NMON collection, and manage data with retention time and keep mode

     zcklvcopy: Check the LV mirror consistency on AIX platform (Only Support the SDD/SDDPCM/Local Disk)

     zsync: Synchronize the files or directories on the machine on Unix/Linux platforms

     To be continue...

6. Usage:

    You can execute the script with parameter "-h" to get the help.

7. Bugts or Feedback

    Welcome contact the zh.weiqing@gmail.com or QQ 83012867 to give me your feedback.

8. Copyright: All of these copyright are owned by Wilkie Zhang (zh.weiqing@gmail.com).
