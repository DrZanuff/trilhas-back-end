import { ITeacherRepository } from '@/repositories/teachers.repository.types'
import { compare, hash } from 'bcryptjs'

export class AuthenticateTeacherUseCase {
  constructor(private teacherRepository: ITeacherRepository) {}

  async execute({ email, password }: { email: string; password: string }) {}
}
