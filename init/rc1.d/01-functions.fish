function clip -d "insert something into the clipboard is it is available"
  if test -e $FD_CLIPBOARD
    echo $argv[1] > $FD_CLIPBOARD
  else
    warn "unable to find clipboard"
  end
end