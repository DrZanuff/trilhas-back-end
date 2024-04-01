import { prisma } from '@/lib/prisma'
import { Prisma } from '@prisma/client'
import { ITeacherRepository } from '@/repositories/teachers.repository.types'
import { randomUUID } from 'node:crypto'

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

  async findByUniqueEmail({ email }: { email: string }) {
    const teacher = await prisma.teacher.findUnique({
      where: {
        email,
      },
    })

    return teacher || null
  }

  async findByUniqueID({ id }: { id: string }) {
    const teacher = await prisma.teacher.findUnique({
      where: {
        id,
      },
    })

    return teacher || null
  }

  async updateSessionID({ id }: { id: string }) {
    const teacher = await prisma.teacher.update({
      where: {
        id,
      },
      data: {
        session_id: randomUUID(),
      },
    })

    return teacher || null
  }

  async endSessionID({ id }: { id: string }) {
    await prisma.teacher.update({
      where: {
        id,
      },
      data: {
        session_id: null,
      },
    })
  }
}
