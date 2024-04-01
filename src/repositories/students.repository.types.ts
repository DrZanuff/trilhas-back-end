import { Prisma, Student } from '@prisma/client'

export interface IStudentRepository {
  create(data: Prisma.StudentCreateInput): Promise<Student>
  findByUniqueEmail({ email }: { email: string }): Promise<Student | null>
  findByUniqueID({ id }: { id: string }): Promise<Student | null>
  updateSessionID({ id }: { id: string }): Promise<Student | null>
  endSessionID({ id }: { id: string }): Promise<void | null>
}
