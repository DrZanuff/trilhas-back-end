import { Student } from '@prisma/client'
import { IStudentRepository } from '@/repositories/students.repository.types'
import { randomUUID } from 'node:crypto'

type StudentPayload = Pick<Student, 'email' | 'password_hash' | 'student_name'>

export class InMemoryStudentRepository implements IStudentRepository {
  items: Student[] = []

  async create({
    email,
    password_hash,
    student_name,
  }: StudentPayload): Promise<Student> {
    const student: Student = {
      email,
      password_hash,
      student_name,
      save_volume: 0,
      save_volume_music: 0,
      save_volume_sfx: 0,
      id: randomUUID(),
    }
    this.items.push(student)

    return student
  }

  async findByUniqueEmail({ email }: { email: string }) {
    const student = this.items.find((item) => item.email === email)

    return student || null
  }
}
