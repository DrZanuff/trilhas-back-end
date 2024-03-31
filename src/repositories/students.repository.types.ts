import { Prisma, Student } from '@prisma/client'

export interface IStudentRepository {
  create(data: Prisma.StudentCreateInput): Promise<Student>
  findByUniqueEmail({ email }: { email: string }): Promise<Student | null>
}
