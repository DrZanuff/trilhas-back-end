import { Prisma, Teacher } from '@prisma/client'

export interface ITeacherRepository {
  create(data: Prisma.TeacherCreateInput): Promise<Teacher>
  findByUniqueEmail({ email }: { email: string }): Promise<Teacher | null>
  findByUniqueID({ id }: { id: string }): Promise<Teacher | null>
  updateSessionID({ id }: { id: string }): Promise<Teacher | null>
  endSessionID({ id }: { id: string }): Promise<void | null>
}
