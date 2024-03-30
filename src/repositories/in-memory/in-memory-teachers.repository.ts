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
      password_hash,
      teacher_name,
      id: randomUUID(),
    }
    this.items.push(teacher)

    return teacher
  }
}
