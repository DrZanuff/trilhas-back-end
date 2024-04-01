import { ERROR_LIST } from '@/constants/erros'
import { IStudentRepository } from '@/repositories/students.repository.types'
import { compare } from 'bcryptjs'

export class AuthenticateStudentUseCase {
  constructor(private studentRepository: IStudentRepository) {}

  async execute({
    email,
    password,
    // courseID,
  }: {
    email: string
    password: string
    courseID?: string
  }) {
    const student = await this.studentRepository.findByUniqueEmail({ email })

    if (!student) {
      throw new Error(ERROR_LIST.AUTH_STUDENT.INVALID_CREDENTIALS)
    }

    const isPasswordCorrect = await compare(password, student.password_hash)

    if (!isPasswordCorrect) {
      throw new Error(ERROR_LIST.AUTH_STUDENT.INVALID_CREDENTIALS)
    }

    const studentWithNewSessionID =
      await this.studentRepository.updateSessionID({ id: student.id })

    if (!studentWithNewSessionID) {
      throw new Error(ERROR_LIST.AUTH_STUDENT.INVALID_CREDENTIALS)
    }

    return { student: studentWithNewSessionID }
  }
}
