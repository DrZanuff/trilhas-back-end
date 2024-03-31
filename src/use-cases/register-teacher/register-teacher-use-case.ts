// import { ERROR_LIST } from '@/constants/erros'
import { ERROR_LIST } from '@/constants/erros'
import { ITeacherRepository } from '@/repositories/teachers.repository.types'
import { hash } from 'bcryptjs'

type RegisterTeacherProps = {
  name: string
  email: string
  password: string
}

export class RegisterTeacherUseCase {
  constructor(private teacherRepository: ITeacherRepository) {}

  async execute({ email, name, password }: RegisterTeacherProps) {
    const password_hash = await hash(password, 6)

    const teacherWithSameEmail = await this.teacherRepository.findByUniqueEmail(
      { email }
    )

    if (teacherWithSameEmail) {
      throw new Error(ERROR_LIST.REGISTER_TEACHER.EMAIL_ALREADY_EXISTS)
    }

    const teacher = await this.teacherRepository.create({
      email,
      password_hash,
      teacher_name: name,
    })

    return { teacher }
  }
}
