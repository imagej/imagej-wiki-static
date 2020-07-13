for f in ../imagej.net/*.mw
do
  name=$(basename "$f")
  name=${name%.mw}
  test -f imagej.net/index.php/$name.html || {
    echo "[$name]"
    wget --page-requisites --html-extension \
      --convert-links --span-hosts \
      --domains imagej.net \
      "http://imagej.net/index.php/$name"
  }
done
