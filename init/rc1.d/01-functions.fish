define_command fdc "fishdots clipboard"
define_subcommand_nonevented fdc copy fdc_copy "clip stdin"
define_subcommand_nonevented fdc file fdc_file "clip the contents of a file"
define_subcommand_nonevented fdc paste fdc_paste "echo the clipboard to stdout"

function fdc_copy -d "insert something into the clipboard is it is available"
  set -l wsl_clipboard_found (which clip.exe | wc -l)
  if test $wsl_clipboard_found = "1"
    echo "$argv" | clip.exe
  else
    warn "unable to find clipboard"
  end
end

function fdc_file -d "insert something into the clipboard is it is available"
  set -l wsl_clipboard_found (which clip.exe | wc -l)
  if test $wsl_clipboard_found = "1"
    cat "$argv" | clip.exe
  else
    warn "unable to find clipboard"
  end
end

function fdc_paste -d "insert something into the clipboard is it is available"
  set -l wsl_ps_found (which powershell.exe | wc -l)
  if test $wsl_ps_found = "1"
    powershell.exe Get-Clipboard
  end
end

