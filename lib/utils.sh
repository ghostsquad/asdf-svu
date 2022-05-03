# get the OS family name
get_os() {
  uname | tr '[:upper:]' '[:lower:]'
}

# get the cpu architecture
get_arch() {
  local os="${1}"

  if [ -z "${os}" ]; then
    echo "architecture depends on OS. multi-arch used for some platforms."
    exit 1
  fi

  # newest releases bundle arm/amd architectures
  # not currently worried about being able to install older versions at the moment, sorry!
  if [ "${os}" == "darwin" ]; then
    echo "all"
    return
  fi

  local -r arch=$(uname -m)

  case $arch in
    x86_64)
      echo amd64
      ;;
    *86)
      echo 386
      ;;
    *)
      # e.g. "arm64"
      echo $arch
      ;;
  esac
}
