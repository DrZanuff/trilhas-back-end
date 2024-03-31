import { Prisma, Teacher } from '@prisma/client'

export interface ITeacherRepository {
  create(data: Prisma.TeacherCreateInput): Promise<Teacher>
  findByUniqueEmail({ email }: { email: string }): Promise<Teacher | null>
}
