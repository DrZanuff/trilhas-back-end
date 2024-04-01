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
      locale: 'pt_BR',
      mouse_icon_scale: 0.2,
      id: randomUUID(),
      session_id: null,
    }
    this.items.push(student)

    return student
  }

  async findByUniqueEmail({ email }: { email: string }) {
    const student = this.items.find((item) => item.email === email)

    return student || null
  }

  async findByUniqueID({ id }: { id: string }) {
    const student = this.items.find((item) => item.id === id)

    return student || null
  }

  async updateSessionID({ id }: { id: string }) {
    const studentIndex = this.items.findIndex((item) => item.id === id)

    const student = this.items[studentIndex]

    if (studentIndex < 0) {
      return null
    }

    const studentWithNewSessionID: Student = {
      ...student,
      session_id: randomUUID(),
    }

    this.items.splice(studentIndex, 1, studentWithNewSessionID)

    return studentWithNewSessionID
  }

  async endSessionID({ id }: { id: string }) {
    const studentIndex = this.items.findIndex((item) => item.id === id)

    const student = this.items[studentIndex]

    if (studentIndex < 0) {
      return null
    }

    const studentWithNewSessionID: Student = {
      ...student,
      session_id: null,
    }

    this.items.splice(studentIndex, 1, studentWithNewSessionID)
  }
}
