export const greeter = (person: string) => {
  return `Hello, ${person}!`;
};

function testGreeter() {
  const user = "Grant";
  Logger.log(greeter(user));
  GmailApp.sendEmail("tamanobi@gmail.com", "hello", "world");
}

function onEdit() {
  Logger.log(lib.greeter("yamu"))
}
