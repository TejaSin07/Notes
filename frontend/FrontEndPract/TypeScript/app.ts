interface Employee {
  id: number;
  name : string;
  salary: number;
}

function getEmployee(emp: Employee): string {
  return emp.name + " earns " + emp.salary;
}

let emp1: Employee = {
  id: 1,
  salary: 50000,
  name: "Tejas"
};

console.log(getEmployee(emp1));