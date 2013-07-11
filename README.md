Quizzical
=========
Quizzical is a very simple shell test suite. Meant as a companion to curl documentation of APIs, it merely checks for a JSON `"success":true` as a response to each request.

Script Setup
------------
Name the script to which curls should be piped `assert`.

```sh
assert=$1
```

Test Format
-----------
Perform your curl requests, and pipe them to the assertion checker with a label, "google" in the example.

```sh
curl -s google.com | $assert "google"
```

Execution
---------
Run the quizzical `test` executable with your file listing tests as a parameter.

```sh
./quizzical/test tests.sh
```