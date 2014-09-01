For the daily operation of AIX or Linux system administrator, the quantity of you managed servers and duplicate tasks will impact seriously your workload and efficency, and these are very baldness and boring. I aim to reduce the daily effort for every Unix/Linux system administrator, so we can release more free time to study some new skills. I named the set of scripts ztools, it includes the zcmd, ,zmksysb,zperf, znmon etc, it will provide you more reliable and simply administrator, the following are the introduction for each tool.

    1. Download: In the below Page "Attachments", please download the latest version in https://www.ibm.com/developerworks/community/wikis/home?lang=en#!/wiki/ztools;

    2. Pre-requisite: The korsh shell must be existed on your system, you can execute the "which ksh" to check if you already install the korsh shell;

    3. Installation: You'd better use the root privilege to decompress the package and execute the "./install.sh";

    4. Uninstall: You just need to use the "rm -fr /usr/local/ztools" to remove this installation directory;
    
    5.  $PATH: You'd better put the tools directory into the system variable $PATH, so you can execute this without absolute path.
          For KSH: edit .profile in the home directory, add the "export PATH=$PATH:/usr/local/ztools/bin"
          For BASH: edit .bash_profile in the home directory, add the "export PATH=$PATH:/usr/local/ztools/bin"
          For CSH: edit .cshrc in the home directory, add the "set path = ($path /usr/local/ztools/bin)"

    6. Component Introduction:
         zcmd: Remote and batch to execute the commands or upload/download files on UNIX/Linux/HMC Platform, same as IBM Tivoli Endpoint Management, but it is Lightly Weight;
         zmksysb: Backup the AIX system and upload the mksysb Image automaticly, support the SCP/SFTP/NFS protocols, it can be used on any AIX servers;
         zperf: Collect and show the daily or hourly vmstat/iostat performance data just in the AIX or Linux Shell, same as IBM Server Resource Management, but it is Lightly Weight and more easy to use;
         zsysinfo: Backup the AIX or Linux system information before rebooting, in case you will lose some settings in next boot;
         znmon: Recall the NMON program, and manage the data with specified keep retention;
         zcklvcopy: Check the LV mirror consistency on AIX platform (Support to check the drivers SDD/SDDPCM/PowerPATH/Local Disk, and 2 or 3 copies);
         zckpwd: Check the AIX IDs which is expiring or expired, then generate the log to be reviewed;
         To be continue...

    7. Usage:
        You can execute the script with parameter "-h" to get the help, or browse the Wiki pages about these scripts.

    8. Bugs or Feedback
        Welcome contact the zh.weiqing@gmail.com or QQ 83012867 to give me your feedback.

    9. Copyright: All of these copyright are owned by Wilkie Zhang (zh.weiqing@gmail.com).
