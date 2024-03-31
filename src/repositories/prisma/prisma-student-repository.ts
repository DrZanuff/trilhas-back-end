import { prisma } from '@/lib/prisma'
import { Prisma } from '@prisma/client'
import { IStudentRepository } from '@/repositories/students.repository.types'

export class PrismaStudentRepository implements IStudentRepository {
  async create({
    email,
    password_hash,
    student_name,
  }: Pick<
    Prisma.StudentCreateInput,
    'email' | 'student_name' | 'password_hash'
  >) {
    const student = await prisma.student.create({
      data: {
        email,
        password_hash,
        student_name,
        save_volume: 0,
        save_volume_music: 0,
        save_volume_sfx: 0,
      },
    })

    return student
  }

  async findByUniqueEmail({ email }: { email: string }) {
    const student = await prisma.student.findUnique({
      where: {
        email,
      },
    })

    return student || null
  }
}
