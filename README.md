Quizzical
=========
Quizzical is a minimal suite of shell and ruby scripts for testing JSON APIs using CURL and automated generation of docs from these tests.

Getting Started
---------------
Quizzical solves a very specific problem - testing a JSON API with CURL. CURL has a very clear and concise notation for expressing the specifications of an API in docs, etc. Additionally, CURL is a cross-platform standard in HTTP requests.

All tests are of the following form.

```sh
curl -s http://localhost:8080/api/boards/123 | $assert "board access" success=true
```

The `curl` progress dialogues are suppressed with `-s`, and then the response is piped to the assertion checker script. A name for the test and criteria are passed as arguments. These criteria are assessed on the JSON response, with `@` being a special symbol for equality with the entire response, e.g., `@={}`.

Additionally, if you are curling a raw file, you can specify `"#raw"` as the criterion and tests will not be checked based on content.

Testing and Spec Generation
---------------------------
To test a script of curls, run the following.

```sh
./Quizzical/quizzical/test tests.sh
```

To generate docs from the same file, run this, as a function of tests and an output markdown file.

```sh
./Quizzical/quizzical/docs.sh tests.sh docs.md
```

Script Control Flow
-------------------
1. `test {tests}` - Initiate testing by passing a curl script to the test script.
2. `{tests} assert.sh` - *test* then fires your script with the assertion checker as the first argument.
3. `curl -s... | assert.sh {test name} {criteria...}` - Your curl script then pipes responses to the assertion checker, with the test name and criteria to assess.
4. `render {passed?}` - The render script is then run with an assessment of pass/fail.
5. `echo "{passed?}: {test}"` - The result is rendered to the user.