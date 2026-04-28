interface User {
  name: string;
  age: number;
}

// destructuring
const user: User = { name: "Tejas", age: 25 };
const { name, age } = user;

// arrow function
const greet = (name: string) => "Hello " + name;

// map
const numbers = [1, 2, 3];
const doubled = numbers.map(n => n * 2);
console.log(doubled);

// async
const fetchData = async () => {
  return "Data received";
};

const main = async () => {
  const data = await fetchData();
  console.log(data);
};

main();

