tell application "Mail"
    activate
    if (count of message viewers) is 0 then
        make new message viewer at front
        set selected mailboxes of message viewer 1 to {inbox}
    end if
end tell
