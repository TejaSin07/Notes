import { useState } from "react";

type LoginFormData = {
  email: string;
  password: string;
};

function LoginForm() {
  const [form, setForm] = useState<LoginFormData>({
    email: "",
    password: ""
  });

  const [error, setError] = useState<string>("");

  // Handle input change (generic)
  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;

    setForm({
      ...form,
      [name]: value
    });
  };

  // Handle submit
  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    // Basic validation
    if (!form.email || !form.password) {
      setError("All fields are required");
      return;
    }

    // Simulate API call
    console.log("Login Request:", form);

    // Reset
    setError("");
  };

  return (
    <div style={{ width: "300px", margin: "50px auto" }}>
      <h2>Login</h2>

      {error && <p style={{ color: "red" }}>{error}</p>}

      <form onSubmit={handleSubmit}>
        <div>
          <input
            type="email"
            name="email"
            placeholder="Enter Email"
            value={form.email}
            onChange={handleChange}
          />
        </div>

        <div style={{ marginTop: "10px" }}>
          <input
            type="password"
            name="password"
            placeholder="Enter Password"
            value={form.password}
            onChange={handleChange}
          />
        </div>

        <button style={{ marginTop: "15px" }} type="submit">
          Login
        </button>
      </form>
    </div>
  );
}

export default LoginForm;