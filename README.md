Quizzical
=========
Quizzical is a minimal suite of shell and ruby scripts for testing JSON APIs using CURL and automated generation of docs from these tests.

Installation
------------

To install quizzical, perform the following command in the terminal.

```sh
$ git clone https://github.com/mattneary/Quizzical.git; \
  cd Quizzical/lib; ./install.sh
```

To download later versions, simply perform this command again.

Testing and Spec Generation
---------------------------
To test a script of curls, run the following.

```sh
quizzical tests.sh
```

To generate docs from the same file, run this, as a function of tests and an output markdown file.

```sh
quizzical tests.sh docs.md
```

Getting Started
---------------
Quizzical solves a very specific problem - testing a JSON API with CURL. CURL has a very clear and concise notation for expressing the specifications of an API in docs, etc. Additionally, CURL is a cross-platform standard in HTTP requests.

All tests are of the following form.

```sh
curl -s http://localhost:8080/api/boards/123 | $assert "board access" success=true
```

The `curl` progress dialogues are suppressed with `-s`, and then the response is piped to the assertion checker script. A name for the test and criteria are passed as arguments. These criteria are assessed on the JSON response, with `@` being a special symbol for equality with the entire response, e.g., `@={}`.

Additionally, if you are curling a raw file, you can specify `"#raw"` as the criterion and tests will not be checked based on content.

Roadmap
-------
- Builtin versioning and updates
- Better test assessment