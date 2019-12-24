path=(~/bin ~/.local/bin $path)
typeset -U PATH

alias ls='ls --color=auto'
alias grep='grep --color=auto'
function() {
    local hostname="$(hostname -f)"
    if [[ $hostname = install*wikimedia* ]]; then
        export REPREPRO_BASE_DIR=/srv/wikimedia
        export GNUPGHOME=/root/.gnupg
    fi
    if [[ $hostname = (nick|steve)-raspi ]]; then
        # This lets us do fun rendezvous-then-NAT-holepunch stuff like
        # mosh --bind-server=any --experimental-remote-ip=remote steve.sidedoor
        local my_external_ip=$(dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com | tr -d \")
        export SSH_CONNECTION="$(echo $SSH_CONNECTION | (read one two three four; echo $one $two $my_external_ip $four ))"
    fi
}
