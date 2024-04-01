import { Teacher } from '@prisma/client'
import { ITeacherRepository } from '@/repositories/teachers.repository.types'
import { randomUUID } from 'node:crypto'

type TeacherPayload = Pick<Teacher, 'email' | 'password_hash' | 'teacher_name'>

export class InMemoryTeacherRepository implements ITeacherRepository {
  items: Teacher[] = []

  async create({
    email,
    password_hash,
    teacher_name,
  }: TeacherPayload): Promise<Teacher> {
    const teacher: Teacher = {
      email,
      session_id: null,
      password_hash,
      teacher_name,
      id: randomUUID(),
    }
    this.items.push(teacher)

    return teacher
  }

  async findByUniqueEmail({ email }: { email: string }) {
    const teacher = this.items.find((item) => item.email === email)

    return teacher || null
  }

  async findByUniqueID({ id }: { id: string }) {
    const teacher = this.items.find((item) => item.id === id)

    return teacher || null
  }

  async updateSessionID({ id }: { id: string }) {
    const teacherIndex = this.items.findIndex((item) => item.id === id)

    const teacher = this.items[teacherIndex]

    if (teacherIndex < 0) {
      return null
    }

    const teacherWithNewSessionID: Teacher = {
      ...teacher,
      session_id: randomUUID(),
    }

    this.items.splice(teacherIndex, 1, teacherWithNewSessionID)

    return teacherWithNewSessionID
  }

  async endSessionID({ id }: { id: string }) {
    const teacherIndex = this.items.findIndex((item) => item.id === id)

    const teacher = this.items[teacherIndex]

    if (teacherIndex < 0) {
      return null
    }

    const teacherWithNewSessionID: Teacher = {
      ...teacher,
      session_id: null,
    }

    this.items.splice(teacherIndex, 1, teacherWithNewSessionID)
  }
}
