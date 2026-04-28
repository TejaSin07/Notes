type Props = {
  name: string;
  age: number;
};

function UserCard({ name, age }: Props) {
  return (
    <div>
      <h3>{name}</h3>
      <p>Age: {age}</p>
    </div>
  );
}

export default UserCard;