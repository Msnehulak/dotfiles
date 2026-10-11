# 1. Aliasy pro eza a systém
alias ls='eza --icons=always --group-directories-first'
alias ll='eza --icons=always -a --group-directories-first'
alias update='sudo pacman -Syu'

alias lg='lazygit'

alias venv='source .venv/bin/activate'

# 2. Načtení barevného schématu pro LS/eza
export LS_COLORS="$(eza --online-git 2>/dev/null)"

# 3. ZSH Systém doplňování (místo bashovského 'complete')
autoload -U compinit && compinit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Ignoruje velká/malá písmena při Tabu

# 4. Oficiální doplňky z Arch repozitáře (pohodlné našeptávání a barvy)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

eval "$(starship init zsh)"

# Velikost historie v paměti i v souboru na disku
export HISTSIZE=10000
export SAVEHIST=10000

# Cesta k souboru, kam se historie ukládá
export HISTFILE="$HOME/.zsh_history"

# Okamžité zapisování příkazů do historie (nezávisle na zavření terminálu)
setopt INC_APPEND_HISTORY

# Smazání staršího duplicitního záznamu, pokud se příkaz opakuje
setopt HIST_IGNORE_ALL_DUPS

# Nepřidávat do historie příkazy, které začínají mezerou (hodí se pro tajná hesla apod.)
setopt HIST_IGNORE_SPACE

export SKOLA_MOUNT_DIR="$HOME/Skola_Disk"

skola-on() {
    # 1. Spuštění VPN na pozadí (pokud už neběží)
    if ! pgrep -x "openfortivpn" > /dev/null; then
        echo "--> Spouštím openfortivpn..."
        sudo openfortivpn &
        
        echo "--> Čekám na navázání VPN tunelu..."
        sleep 8
    else
        echo "--> VPN už běží."
    fi

    # 2. Vytvoření složek až po spuštění VPN
    mkdir -p "$SKOLA_MOUNT_DIR/moje" "$SKOLA_MOUNT_DIR/sdilene" 2>/dev/null

    # 3. Připojení osobního disku (pokud ještě není připojen)
    if ! mountpoint -q "$SKOLA_MOUNT_DIR/moje"; then
        echo "--> Připojuji osobní disk..."
        sudo mount -t cifs //kacenka.litv.sssvt.cz/StudentiPrenosne/HermanMaxim10 "$SKOLA_MOUNT_DIR/moje" -o credentials=$HOME/.skola_credentials,vers=2.0,uid=$USER
    else
        echo "--> Osobní disk už je připojen."
    fi

    # 4. Připojení sdílených dat (pokud ještě nejsou připojena)
    if ! mountpoint -q "$SKOLA_MOUNT_DIR/sdilene"; then
        echo "--> Připojuji sdílená data..."
        sudo mount -t cifs //kacenka.litv.sssvt.cz/SdilenaData "$SKOLA_MOUNT_DIR/sdilene" -o credentials=$HOME/.skola_credentials,vers=2.0,uid=$USER
    else
        echo "--> Sdílená data už jsou připojena."
    fi

    echo "--> Hotovo! Disky jsou připraveny v: $SKOLA_MOUNT_DIR"
}

skola-off() {
    echo "--> Odpojuji školní disky..."
    sudo mount -t cifs //kacenka.litv.sssvt.cz/StudentiPrenosne/HermanMaxim10 "$SKOLA_MOUNT_DIR/moje" -o credentials=$HOME/.skola_credentials,vers=2.0,uid=$USER,user
    sudo umount -l "$SKOLA_MOUNT_DIR/moje" 2>/dev/null
    sudo umount -l "$SKOLA_MOUNT_DIR/sdilene" 2>/dev/null
    
    echo "--> Ukončuji VPN..."
    sudo pkill -x openfortivpn
    
    echo "--> Hotovo. Odpojeno."
}


# Added by Antigravity CLI installer
export PATH="/home/snehulak/.local/bin:$PATH"


