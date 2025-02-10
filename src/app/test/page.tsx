import prisma from "@/lib/database";

export async function Page() {
  const users = prisma.user.findMany();

  console.log(users);
}
