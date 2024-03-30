import { prisma } from '@/lib/prisma'
import { Prisma } from '@prisma/client'
import { ITeacherRepository } from '@/repositories/teachers.repository.types'

export class PrismaTeacherRepository implements ITeacherRepository {
  async create({
    email,
    password_hash,
    teacher_name,
  }: Pick<
    Prisma.TeacherCreateInput,
    'email' | 'teacher_name' | 'password_hash'
  >) {
    const teacher = await prisma.teacher.create({
      data: {
        email,
        password_hash,
        teacher_name,
      },
    })

    return teacher
  }
}
